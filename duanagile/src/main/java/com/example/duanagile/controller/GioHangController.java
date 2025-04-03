package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GioHangController {
    @GetMapping("/gio-hang/hien-thi")
    public String hienThiGioHang() {
        return "gioHang/hien-thi";
    }
}
