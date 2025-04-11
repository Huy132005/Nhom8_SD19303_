package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ThongKeController {
    @GetMapping("/thong-ke/hien-thi")
    public String thongKe() {return "ThongKe/hien-thi";}
}
