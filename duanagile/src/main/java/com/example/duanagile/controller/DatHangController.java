package com.example.duanagile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DatHangController {

    // Hiển thị form đặt hàng
    @GetMapping("/dat-hang/hien-thi")
    public String hienThiDatHang() {
        return "datHang/hien-thi"; // Trả về trang hien-thi.html
    }

    // Xử lý đơn hàng
    @PostMapping("/dat-hang/xu-ly")
    public String xuLyDatHang(@RequestParam("tenNguoiNhan") String fullName,
                              @RequestParam("diaChi") String address,
                              @RequestParam("soDienThoai") String phone,
                              @RequestParam(value = "ghiChu", required = false) String note,
                              @RequestParam("phuongThuc") String paymentMethod) {

        // Xử lý thanh toán theo phương thức
        System.out.println("Họ và tên: " + fullName);
        System.out.println("Địa chỉ: " + address);
        System.out.println("Số điện thoại: " + phone);
        System.out.println("Ghi chú: " + (note != null ? note : "Không có ghi chú"));
        System.out.println("Phương thức thanh toán: " + paymentMethod);

        // Nếu chọn phương thức "chuyển khoản", chuyển tới trang xác nhận
        if ("chuyen-khoan".equals(paymentMethod)) {
            return "redirect:/dat-hang/xac-nhan"; // Chuyển hướng tới trang xác nhận khi chọn chuyển khoản
        }

        // Nếu không phải phương thức chuyển khoản, chuyển hướng đến trang mã QR
        return "redirect:/dat-hang/qr-code"; // Chuyển đến trang mã QR nếu phương thức khác
    }

    // Trang mã QR
    @GetMapping("/dat-hang/qr-code")
    public String hienThiQR() {
        return "datHang/qr-code"; // Trả về trang qr-code.html
    }

    // Trang xác nhận
    @GetMapping("/dat-hang/xac-nhan")
    public String xacNhan() {
        return "datHang/xac-nhan"; // Trả về trang xac-nhan.html
    }
}
