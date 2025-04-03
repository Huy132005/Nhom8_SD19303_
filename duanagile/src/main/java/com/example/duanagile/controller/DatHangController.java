package com.example.duanagile.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class DatHangController {
    @GetMapping("/dat-hang/hien-thi")
    public String hienThidatHang() {
        return "datHang/hien-thi";
    }
}
