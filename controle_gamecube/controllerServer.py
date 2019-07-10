import socket
import pyautogui as pag

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 7777))
s.listen(1)

conn, addr = s.accept()
print ('IP conectado:', addr)

a_down = False
b_down = False
buttons = None
while True:
    rd = conn.recv(2000)
    start = bool(rd[0] & 1>>3)
    y = bool(rd[0] & 1>>4)
    x = bool(rd[0] & 1>>5)
    b = bool(rd[0] & 1>>6)
    a = bool(rd[0] & 1>>7)
    l = bool(rd[1] & 1>>1)
    r = bool(rd[1] & 1>>2)
    z = bool(rd[1] & 1>>3)
    d_up = bool(rd[1] & 1>>4)
    d_down = bool(rd[1] & 1>>5)
    d_right = bool(rd[1] & 1>>6)
    d_left = bool(rd[1] & 1>>7)
    joy_x = rd[2] if rd[2] < 128 else rd[2] - 256
    joy_y = rd[3] if rd[3] < 128 else rd[3] - 256
    c_x = rd[4]
    c_y = rd[5]
    l_trig = rd[6]
    r_trig = rd[7]

    old_buttons = buttons
    buttons = (start, y, x, b, a, l, r, z, d_up, d_down, d_right, d_left, joy_x, joy_y, c_x, c_y, l_trig, r_trig)

    if d_up:
        pag.moveRel(None, -10, 0.01)
    if d_down:
        pag.moveRel(None, 10, 0.01)
    if d_left:
        pag.moveRel(-10, None, 0.01)
    if d_right:
        pag.moveRel(10, None, 0.01)

    pag.moveRel(10*joy_x/128, 10*joy_y/128, 0.01)

    if a and not a_down:
        pag.mouseDown()
        a_down = True
    elif not a and a_down:
        pag.mouseUp()
        a_down = False
    if b and not b_down:
        pag.mouseDown(button='right')
        b_down = True
    elif not b and b_down:
        pag.mouseUp(button='right')
        b_down = False

    print()
conn.close()
