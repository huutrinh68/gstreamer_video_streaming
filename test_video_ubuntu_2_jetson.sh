CLIENT_IP=10.192.37.51
UDP_PORT=5200
VIDEO_PATH="./videos/mp4video.mp4"

gst-launch-1.0 filesrc location=$VIDEO_PATH ! decodebin ! videorate ! video/x-raw, framerate=30/1 ! jpegenc ! rtpjpegpay ! udpsink host=$CLIENT_IP port=$UDP_PORT
