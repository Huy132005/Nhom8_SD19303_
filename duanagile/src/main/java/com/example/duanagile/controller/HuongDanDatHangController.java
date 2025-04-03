package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HuongDanDatHangController {
    @GetMapping("/huong-dan-dat-hang/hien-thi")
    public String hienThiHuongDanDatHang() {
        return "huongDanDatHang/hien-thi";
    }
}
