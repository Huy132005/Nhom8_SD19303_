package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class KienThucController {
    @GetMapping("/kienThuc/hien-thi")
    public String hienThiKienThuc() {
        return "kienThuc/hien-thi";
    }
}
