package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/gwpart")
public class gwpartController {

	
	@RequestMapping("/carts")
	public void carts() {
		log.info("carts method");
	}
	@RequestMapping("/product")
	public void product() {
		log.info("product method");
	}
	@RequestMapping("/orders")
	public void orders() {
		log.info("orders method");
	}
	@RequestMapping(value = "/carts", method = RequestMethod.GET)
    public String index(Principal principal, Model model) {
        // 현재 사용자
        int currUserId = userMapper.selectUserByEmail(principal.getName()).getId();
        // 카트에
        CartVO cart = userMapper.getCart(currUserId);
        if (cart != null) {
            // 담긴 아이템
            List<ItemVO> items = cartMapper.getItems(cart);
            for (ItemVO i : items) {
                i.setBook(bookMapper.getBook(i.getBook_id())); // 아이템이 가리키는 책
            }
            // 합계
            int sum = 0;
            for (ItemVO i : items) {
                sum += i.getPrice() * i.getAmount();
            }
            cart.setTotalPrice(sum);
            model.addAttribute("cart", cart);
            model.addAttribute("items", items);
        }
        return "carts/index";
    }
    @RequestMapping(value = "/carts/add", method = RequestMethod.POST)
    public String add(@ModelAttribute ItemVO item, Principal principal) {
        // 현재 사용자
        UserVO currentUser = userMapper.selectUserByEmail(principal.getName());
        // 쇼핑카트(현재 사용자 소유) 번호를 아이템에 저장
        if (!userMapper.hasCart(CartVO.SHOPPING)) {
            int cartId = cartMapper.create(new CartVO(CartVO.SHOPPING, currentUser.getId()));
            item.setCart_id(cartId);
        } else {
            item.setCart_id(userMapper.getCart(currentUser.getId()).getId());
        }
        // 쇼핑카트에 아이템을 담음
        cartMapper.add(item);
        return "redirect:/carts";
    }
    @RequestMapping(value = "/orders", method = RequestMethod.POST)
    public String create(@ModelAttribute CartVO cart) {
        cartMapper.order(cart);
        return "redirect:/orders";
    }
    @RequestMapping(value = "/orders", method = RequestMethod.GET)
    public String index(Principal principal, Model model) {
        // 현재 사용자
        int currUserId = userMapper.selectUserByEmail(principal.getName()).getId();
        // 주문 목록
        List<CartVO> orders = userMapper.getOrders(currUserId);
        // 주문별 아이템
        for (CartVO order : orders) {
            order.setItems(cartMapper.getItems(order));
            // 아이템-책
            int sum = 0;
            for (ItemVO i : order.getItems()) {
                i.setBook(bookMapper.getBook(i.getBook_id()));
                sum += i.getPrice() * i.getAmount();
            }
            order.setTotalPrice(sum);
        }
        model.addAttribute("orders", orders);
        return "orders/index";
    }

}
