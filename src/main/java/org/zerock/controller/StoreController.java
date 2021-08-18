package org.zerock.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.CartVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.SProductVO;
import org.zerock.domain.WishVO;
import org.zerock.service.SProductService;
import org.zerock.service.StoreService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store")
@AllArgsConstructor
public class StoreController {

	@Setter(onMethod_ = @Autowired)
	private SProductService service;

	@Setter(onMethod_ = @Autowired)
	private StoreService stservice;

	@GetMapping("/main")
	public void store(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("store method");
		int total = service.getTotal(cri);

		List<SProductVO> list = service.getList(cri);

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

	}
	//찜 목록
	@GetMapping("/wish")
	@PreAuthorize("isAuthenticated()")
	public void wish(WishVO vo, Principal principal, Model model) {
		log.info(principal.getName());
		vo.setUserid(principal.getName());
		List<WishVO> wishlist = stservice.wishlist(principal.getName());
		model.addAttribute("wishlist", wishlist);
		log.info("확인되었습니다.");
	}
	//찜 담기
	@PostMapping("/detail")
	@PreAuthorize("isAuthenticated()")
	public String pwish(WishVO vo, Principal principal, Model model, SProductVO svo, RedirectAttributes rttr, String pageNum, String amount){
		log.info(principal.getName());
		vo.setUserid(principal.getName());		
		log.info("추가되었습니다.");
		long count = stservice.countwish(vo.getPno(), principal.getName());
		log.info(count);
		if (count == 0) {
			stservice.addWish(vo);
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "저장");
			rttr.addFlashAttribute("messageBody", "찜목록에 저장되었습니다.");
			
			rttr.addAttribute("pno", vo.getPno());
			rttr.addAttribute("pageNum", pageNum);
			rttr.addAttribute("amount", amount);
			return "redirect:/store/detail";
		} else {
			stservice.cwishdelete(vo.getPno(), principal.getName());;
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "삭제");
			rttr.addFlashAttribute("messageBody", "찜목록에서 삭제하였습니다.");
			
			rttr.addAttribute("pno", vo.getPno());
			rttr.addAttribute("pageNum", pageNum);
			rttr.addAttribute("amount", amount);
			return "redirect:/store/detail";
		}
	}
	
	// 찜 관련 삭제
	@PostMapping("/wishdelete")
	public String wishdelete(@RequestParam("wno") Long wno) {
		stservice.wishdelete(wno);
		return "redirect:/store/wish";
	}
	
	// 카트 담기
	@PostMapping("/cart")
	@PreAuthorize("isAuthenticated()")
	public String cart(CartVO vo, Principal principal, Model model, SProductVO svo) {
		log.info(principal.getName());
		vo.setUserid(principal.getName());
		long count = stservice.countCart(vo.getPno(), principal.getName());
		log.info(count);
		if (count == 0) {
			stservice.addCart(vo);
		} else {
			stservice.updateCart(vo);
		}
		return "redirect:/store/cart";
	}

	// 카트에 담은 거 보여주기
	@GetMapping("/cart")
	@PreAuthorize("isAuthenticated()")
	public void getcart(CartVO vo, Principal principal, Model model) {
		log.info(principal.getName());
		vo.setUserid(principal.getName());
		long sumMoney = stservice.sumMoney(principal.getName());
		log.info(sumMoney);
		vo.setSumMoney(sumMoney);
		model.addAttribute("sumMoney", sumMoney);
		List<CartVO> cartlist = stservice.listCart(principal.getName());
		model.addAttribute("cart", cartlist);

	}

	// 카트 삭제
	@PostMapping("/cartdelete")
	public String cartdelete(@RequestParam("cno") Long cno) {
		stservice.cartdelete(cno);
		return "redirect:/store/cart";
	}

	// 카트 수정하기
	@GetMapping("/cartupdate")
	public void cartupdate(CartVO vo) {
		log.info(vo);
		stservice.modifyCart(vo);
		log.info("########cartupdate#########");
		log.info(vo.getCartstock());

	}

	@RequestMapping("/order")
	public void order() {

	}

	@GetMapping("/register")
	public void register(@ModelAttribute("cri") Criteria cri) {

	}

	@PostMapping("/register")
	public String register(SProductVO svo, @RequestParam("store_file") MultipartFile[] store_file,
			RedirectAttributes rttr) {
		service.register(svo, store_file);
		rttr.addFlashAttribute("result", svo.getPno());
		return "redirect:/store/main";
	}

	@GetMapping({ "/detail", "/modify" })
	public void get(@RequestParam("pno") Long pno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("store/detail method");

		SProductVO svo = service.read(pno);

		model.addAttribute("store", svo);

	}

	@PostMapping("/modify")
	// @PreAuthorize("principal.username == #board.writer")
	// @PreAuthorize("authication.name == #board.writer") // spring.io
	public String modify(SProductVO svo, Criteria cri, @RequestParam("store_file") MultipartFile[] store_file,
			RedirectAttributes rttr) {

		boolean success = service.modify(svo, store_file);

		if (success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "수정 성공");
			rttr.addFlashAttribute("messageBody", "수정 되었습니다.");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		return "redirect:/store/main";
	}

	@PostMapping("/remove")
//			@PreAuthorize("principal.username == #writer") // 720 쪽
	public String remove(@RequestParam("pno") Long pno, Criteria cri, RedirectAttributes rttr, String writer) {
		// parameter 수집

		// service 일
		boolean success = service.remove(pno);
		// 결과 담고
		if (success) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("messageTitle", "삭제 성공");
			rttr.addFlashAttribute("messageBody", "삭제 되었습니다.");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());

		// forward or redirect
		return "redirect:/store/main";

	}
	
	

}