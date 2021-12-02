package kr.co.iotb.web.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.iotb.model.board.dto.BoardVO;
import kr.co.iotb.model.board.dto.PageInfo;
import kr.co.iotb.model.board.dto.PageVO;
import kr.co.iotb.service.board.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//Dependency Injection ���� service�� �־���
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/writeForm")
	public String writeForm(HttpServletRequest request, HttpServletResponse response, 
							Model model, BoardVO vo, PageVO pvo) {
		if(vo != null && vo.getNum()!=0 && vo.getRef()!=0)
			model.addAttribute("dto", vo);
		return "board/writeForm";
	}
	
	@RequestMapping("/writePro")
	public String writePro(HttpServletRequest request, HttpServletResponse response, 
			Model model, BoardVO vo, PageVO pvo) {
		vo.setIp(request.getRemoteAddr());
		logger.info(vo.toString());
		int r = boardService.writePro(vo);
		String msg, url;
		if(r>0) {
			msg = "�Խñ��� ����Ǿ����ϴ�.";
		}else {
			msg = "�Խñ� ���忡 �����߽��ϴ�.";
		}
		url = "list";
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		return "board/MsgPage";
	}
	
	@RequestMapping("/updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response, 
			Model model, BoardVO vo, PageVO pvo) {
		logger.info("updateForm--->" + pvo.toString());
		model.addAttribute("dto", vo);
		model.addAttribute("pvo", pvo);
		return "board/updateForm";
	}
	
	@RequestMapping("/updatePro")
	public String updatePro(HttpServletRequest request, HttpServletResponse response, 
			Model model, BoardVO vo, PageVO pvo) {
		logger.info("---->" + pvo.toString());
		if(pvo.getCurrentPage()==0) {
			   pvo.setCurrentPage(1);	
			}
			if(pvo.getCurrentBlock()==0) {
				pvo.setCurrentBlock(1);	
			}
		vo.setIp(request.getRemoteAddr());
		int r = boardService.updatePro(vo);
		String msg, url;
		if(r>0) {
			msg = "�Խñ��� �����Ǿ����ϴ�.";
		}else {
			msg = "�Խñ� ������ �����߽��ϴ�.";
		}
		url = "list?currentPage=" + pvo.getCurrentPage();
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("pvo", pvo);
		return "board/MsgPage";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, HttpServletResponse response,
			Model model, BoardVO vo, PageVO pvo) {
		if(pvo.getCurrentPage()==0) {
		   pvo.setCurrentPage(1);	
		}
		if(pvo.getCurrentBlock()==0) {
			pvo.setCurrentBlock(1);	
		}
		//��ü ���� ���� ���ϴ� service ȣ��
		pvo.setAllCount(boardService.getAllCount());
		List<BoardVO> list = boardService.getArticles(vo, pvo);
			if(pvo.getAllCount() % PageInfo.ROW_PER_PAGE==0)
				pvo.setPagAllCnt(pvo.getAllCount() / PageInfo.ROW_PER_PAGE);
			else
				pvo.setPagAllCnt(pvo.getAllCount() / PageInfo.ROW_PER_PAGE+1);
		model.addAttribute("list", list);
		model.addAttribute("pvo", pvo);
		
		return "board/list";
	}
	
	@RequestMapping("/content")
	public String content(HttpServletRequest request, HttpServletResponse response, 
			Model model, BoardVO vo, PageVO pvo) {
			if(pvo.getCurrentPage()==0) {
				pvo.setCurrentPage(1);
			}
			if(pvo.getCurrentBlock()==0) {
				pvo.setCurrentBlock(1);
			}
		BoardVO svo = boardService.getArticle(vo);
		model.addAttribute("dto", svo);
		model.addAttribute("pvo", pvo);
		return "board/content";
	}
	
	@RequestMapping("/deletePro")
	public String deletePro(HttpServletRequest request, HttpServletResponse response, 
			Model model, BoardVO vo, PageVO pvo) {
			if(pvo.getCurrentPage()==0) {
				pvo.setCurrentPage(1);
			}
			if(pvo.getCurrentBlock()==0) {
				pvo.setCurrentBlock(1);
			}
			int r = boardService.deletePro(vo);
			 String msg, url;
			 if(r>0) {
				msg = "�Խñ��� �����Ǿ����ϴ�.";
			 }else {
				msg = "�Խñ� ������ �����߽��ϴ�.";
			 }
			 url = "list";
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			 model.addAttribute("pvo", pvo);
			 return "board/MsgPage";
	}
}
