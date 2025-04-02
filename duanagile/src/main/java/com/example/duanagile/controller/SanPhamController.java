package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SanPhamController {
    @GetMapping("/sanPham/hien-thi")
    public String hienThiSanPham() {
        return "sanPham/hien-thi";
    }
}
