import numpy as np
import cv2

cmd = "gst-launch-1.0 v4l2src device=/dev/video0 ! video/x-raw, width=640, height=480 !  jpegenc !  rtpjpegpay !  udpsink host=10.192.37.51 port=5200"

cap = cv2.VideoCapture("gst-launch-1.0 videotestsrc ! autovideosink", cv2.CAP_GSTREAMER) # check this
while(True):
    # Capture frame-by-frame
    ret, frame = cap.read()

    # Our operations on the frame come here
    # frame = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    # Display the resulting frame
    cv2.imshow('frame',frame)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()

# import cv2

# cap = cv2.VideoCapture("gst-launch-1.0 videotestsrc ! autovideosink", cv2.CAP_GSTREAMER)

# while True:
#     ret, img = cap.read()
#     if not ret:
#         break

#     cv2.imshow("",img)
#     key = cv2.waitKey(1)
#     if key==27: #[esc] key
#         break