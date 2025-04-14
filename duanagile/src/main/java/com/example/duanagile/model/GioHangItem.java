package com.example.duanagile.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GioHangItem {
    private Integer sanPhamId;
    private String tenSanPham;
    private String hinhAnh;
    private Float gia;
    private Integer soLuong;
}
