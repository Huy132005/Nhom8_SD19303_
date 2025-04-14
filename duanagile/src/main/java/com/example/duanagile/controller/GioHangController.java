package com.example.duanagile.controller;

import com.example.duanagile.model.GioHangItem;
import com.example.duanagile.model.SanPham;
import com.example.duanagile.repository.SanPhamRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

@Controller
@RequestMapping("/gio-hang")
public class GioHangController {

    @Autowired
    private SanPhamRepository sanPhamRepository;

    @GetMapping("/hien-thi")
    public String hienThiGioHang(HttpSession session, Model model) {
        List<GioHangItem> gioHang = (List<GioHangItem>) session.getAttribute("gioHang");
        if (gioHang == null) {
            gioHang = new ArrayList<>();
        }
        model.addAttribute("gioHang", gioHang);
        return "gioHang/hien-thi";
    }

    @PostMapping("/them")
    public String themVaoGioHang(@RequestParam("sanPhamId") Integer sanPhamId,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {

        // Lấy sản phẩm từ database
        Optional<SanPham> optional = sanPhamRepository.findById(sanPhamId);
        if (optional.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "Không tìm thấy sản phẩm.");
            return "redirect:/san-pham/hien-thi";
        }
        SanPham sp = optional.get();

        // Lấy giỏ hàng từ session
        List<GioHangItem> gioHang = (List<GioHangItem>) session.getAttribute("gioHang");
        if (gioHang == null) {
            gioHang = new ArrayList<>();
        }

        // Kiểm tra sản phẩm đã có trong giỏ chưa
        boolean found = false;
        for (GioHangItem item : gioHang) {
            if (item.getSanPhamId().equals(sp.getId())) {
                item.setSoLuong(item.getSoLuong() + 1);
                found = true;
                break;
            }
        }

        if (!found) {
            GioHangItem item = new GioHangItem(
                    sp.getId(),
                    sp.getName(),
                    sp.getImage(),
                    sp.getPrice(),
                    1
            );
            gioHang.add(item);
        }

        session.setAttribute("gioHang", gioHang);
        redirectAttributes.addFlashAttribute("message", "Đã thêm sản phẩm vào giỏ hàng.");
        return "redirect:/gio-hang/hien-thi";
    }
}
