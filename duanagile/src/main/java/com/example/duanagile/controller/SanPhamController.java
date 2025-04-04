package com.example.duanagile.controller;

import com.example.duanagile.model.SanPham;
import com.example.duanagile.repository.SanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/san-pham")
public class SanPhamController {
    @Autowired
    private SanPhamRepository sanPhamRepository;

    @GetMapping("/hien-thi")
    public String hienThi(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<SanPham> danhSachSanPham;

        if (keyword != null && !keyword.isEmpty()) {
            danhSachSanPham = sanPhamRepository.findByNameContainingIgnoreCase(keyword);
        } else {
            danhSachSanPham = sanPhamRepository.findAll();
        }

        model.addAttribute("danhSachSanPham", danhSachSanPham);
        model.addAttribute("keyword", keyword);
        return "sanPham/hien-thi";
    }
}
