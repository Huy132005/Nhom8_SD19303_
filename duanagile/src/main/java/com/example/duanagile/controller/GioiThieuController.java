package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GioiThieuController {
    @GetMapping("/gioiThieu/hien-thi")
    public String hienThiGioiThieu() {
        return "gioiThieu/hien-thi";
    }
}
