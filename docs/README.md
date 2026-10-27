# Hệ thống Giám sát SmartFarm

## Hướng dẫn chạy script

```powershell
# Chạy script tự động lọc log và xuất báo cáo sự cố
.\scripts\auto_report.sh
```

---

## Checklist kiểm tra thiết bị

- [x] Kiểm tra kết nối mạng và nguồn điện tại trạm sensor-03
- [ ] Vệ sinh và kiểm tra cảm biến độ ẩm đất tại khu vực A
- [ ] Bảo trì định kỳ modem truyền dữ liệu trung tâm

---

## Bảng thông số phần cứng

| Tên thiết bị | Đơn giá (VND) | Loại Storage |
| :--- | :--- | :--- |
| Intel NUC i3 | 8.500.000 | SSD |
| Raspberry Pi 4 Model B | 2.100.000 | MicroSD |
| Synology DS220j NAS | 5.200.000 | HDD |

---

## Phân tích hệ thống

### 1. Phân tích Input – Process – Output (Chức năng lọc log)

* **Input:** File nhật ký hệ thống (`.log`) chứa các dòng ghi nhận trạng thái hoạt động và thông báo lỗi của thiết bị.
* **Process:** Script PowerShell (`auto_report.sh`) thực hiện đọc file log, dùng `grep` lọc ra các dòng chứa từ khóa `ERROR, CRITICAL`, đếm tổng số dòng lỗi thông qua Pipeline, và định dạng dữ liệu đầu ra.
* **Output:** Báo cáo danh sách các dòng lỗi kèm dòng thống kê tổng số sự cố (`TONG SO SU CO: <số_lượng>`) ghi vào file báo cáo.

---

### 2. Phân loại mô hình DIKW (Data – Information – Knowledge – Wisdom)

* **(b) Data:**  
  > *“2026-10-12 08:15:01 [ERROR] sensor-03 Connection TIMEOUT after 30s”*  
  Đây là dòng dữ liệu nhật ký thô chưa qua xử lý hay tổng hợp.

* **(c) Information**  
  > *“Hôm nay hệ thống ghi nhận 8 sự cố, trong đó 4 sự cố đến từ trạm sensor-03.”*  
   Dữ liệu thô đã đc thống kê, gom nhóm và xử lý để có ngữ cảnh

* **(d) Knowledge:**  
  > *“Trạm sensor-03 hay mất kết nối vào buổi chiều do sóng yếu, nên cần lắp thêm anten.”*  
  Thông tin được phân tích, tìm ra nguyên nhân quy luật (mất kết nối buổi chiều do sóng yếu) và đưa ra hiểu biết sâu sắc.


* **(a) Wisdom:**  
  > *“Quyết định thay modem trạm sensor-03 trước thứ Sáu.”*  
   Đưa ra hành động cụ thể, chiến lược dựa trên tri thức đã tổng hợp để giải quyết triệt me vấn đề

