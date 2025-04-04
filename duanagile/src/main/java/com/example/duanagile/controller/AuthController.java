package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Taikhoan")
public class AuthController {
    @GetMapping("/dang-nhap")
    public String showLoginForm() {
        return "DangNhap";
    }
    @GetMapping("/dang-ky")
    public String register() {
        return "DangKy";
    }
}
