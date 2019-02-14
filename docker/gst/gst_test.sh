# streaming parameters
CLIENT_IP=10.192.37.51
PORT=5200
VIDEO_PATH_1="./videos/Hanoi-HoanKiem1.MOV"
VIDEO_PATH_2="./videos/mp4video.mp4"
VIDEO_PATH_3="./videos/mp4video.webm"
# test camera
# gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480 !  jpegenc !  rtpjpegpay !  udpsink host=10.192.37.51 port=5200

# test video mp4
# gst-launch-1.0 filesrc location=./mp4video.mp4 ! decodebin ! videorate ! video/x-raw, framerate=30/1 ! autovideosink

# streaming video to client
gst-launch-1.0 filesrc location=$VIDEO_PATH_1 ! decodebin ! videorate ! video/x-raw, framerate=30/1 ! jpegenc ! rtpjpegpay ! udpsink host=$CLIENT_IP port=$PORT


#### receiver:
#gst-launch-1.0 udpsrc port=5200 !  application/x-rtp, encoding-name=JPEG,payload=26 !  rtpjpegdepay !  jpegdec !  autovideosink