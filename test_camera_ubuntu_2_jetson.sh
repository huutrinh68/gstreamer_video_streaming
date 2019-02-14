CLIENT_IP=10.192.37.51
PORT=5200

gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480 !  jpegenc !  rtpjpegpay !  udpsink host=$CLIENT_IP port=$PORT
