package com.example.duanagile.repository;

import com.example.duanagile.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham,Integer> {
    List<SanPham> findByNameContainingIgnoreCase(String keyword);
    }
