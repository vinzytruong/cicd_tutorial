FROM ubuntu:latest

MAINTAINER Phuc Vinh "vinhtruong.dev@gmail.com"

# Cập nhật hệ thống và cài đặt các công cụ cần thiết
RUN apt update -y
RUN apt install -y python3-pip python3-dev build-essential python3-venv

# Tạo một virtual environment và cài đặt yêu cầu
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Sao chép mã nguồn vào container
ADD . /flask_app
WORKDIR /flask_app

# Cài đặt các gói Python từ requirements.txt
RUN pip install -r requirements.txt

# Chạy Flask ứng dụng
ENTRYPOINT ["python3"]
CMD ["flask_docker.py"]
