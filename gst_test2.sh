# streaming parameters
CLIENT_IP=10.192.37.51
# CLIENT_IP=10.192.36.180
UDP_PORT_1=5200
UDP_PORT_2=5201
VIDEO_PATH_1="./videos/Hanoi-HoanKiem1.MOV"
VIDEO_PATH_2="./videos/mp4video.mp4"
VIDEO_PATH_3="./videos/mp4video.webm"
VIDEO_PATH_4="./videos/Hanoi-HoanKiem1.mp4"

# convert mov to mp4
#ffmpeg -i ./videos/Hanoi-HoanKiem1.MOV -pix_fmt yuv420p ./videos/Hanoi-HoanKiem1.mp4
# ffmpeg -i ./videos/Hanoi-HoanKiem1.MOV -vcodec h264 -acodec mp2 ./videos/Hanoi-HoanKiem1.mp4

# test camera
gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480 !  jpegenc !  rtpjpegpay !  udpsink host=$CLIENT_IP port=$UDP_PORT_1

# test video mp4
# gst-launch-1.0 filesrc location=./mp4video.mp4 ! decodebin ! videorate ! video/x-raw, framerate=30/1 ! autovideosink

# streaming video to client
# gst-launch-1.0 filesrc location=$VIDEO_PATH_2 ! decodebin ! videorate ! video/x-raw, framerate=30/1 ! jpegenc ! rtpjpegpay ! udpsink host=$CLIENT_IP port=$UDP_PORT_1
# gst-launch-1.0 filesrc location=$VIDEO_PATH_3 ! decodebin ! videorate ! video/x-raw, framerate=30/1 ! jpegenc ! rtpjpegpay ! udpsink host=$CLIENT_IP port=$UDP_PORT_2

# gst-launch-1.0 filesrc location=$VIDEO_PATH_2 ! queue ! qtdemux name=dem dem. ! queue ! \
# rtph264pay ! udpsink host=$CLIENT_IP port=$UDP_PORT auto-multicast=true dem. ! queue ! \
# rtpmp4apay ! udpsink host=$CLIENT_IP port=$UDP_PORT auto-multicast=true
# gst-launch-1.0 filesrc location=$VIDEO_PATH_2 ! decodebin !  videorate ! video/x-raw, width=1920, height=1080, framerate=30/1 ! autovideosink

#### receiver:
# gst-launch-1.0 udpsrc port=UDP_PORT_1 !  application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec ! autovideosink
# gst-launch-1.0 udpsrc port=UDP_PORT_2 !  application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec ! autovideosink

