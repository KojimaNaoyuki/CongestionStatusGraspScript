# -*- coding: utf-8 -*-
import PySimpleGUI as sg
from screeninfo import get_monitors
import subprocess
import sys
import webbrowser

monitor = get_monitors()[0]
window_size = (monitor.width, monitor.height)
print(window_size)

sg.theme('DarkAmber')   # デザインテーマの設定

col1 = [
    [sg.Text('Congestion Measuring System', font=('Arial', 30))],
]
col2 = [
    [
      sg.Text('Measurement point name', font=('Arial', 16)), sg.InputText(font=('Arial', 20), size=(10, 2)),
      sg.Text('Distance to ceiling [m]', font=('Arial', 16)), sg.InputText(font=('Arial', 20), size=(10, 2)),
      sg.Text('Reduction ratio (1/input)', font=('Arial', 16)), sg.InputText(font=('Arial', 20), size=(10, 2))
    ]
]
col3 = [
    [sg.Button('Measurement point registration', font=('Arial', 20), size=(100, 2))],
]
col4 = [
    [sg.Button('Start measurement', font=('Arial', 20), size=(100, 2))],
]
col5 = [
    [sg.Button('End measurement', font=('Arial', 20), size=(100, 2))],
]

# ウィンドウに配置するコンポーネント
layout = [  
    [sg.Column(col1, justification='c')],
    [sg.Column(col2, justification='c')],
    [sg.Column(col3, justification='c')],
    [sg.Column(col4, justification='c')],
    [sg.Column(col5, justification='c')] 
]

# ウィンドウの生成
window = sg.Window('Congestion Measuring System', layout, resizable=True, size=(window_size[0], window_size[1]))

# イベントループ
while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED:
        break
    elif event == 'Measurement point registration':
        f = open('/opt/CongestionStatusGraspScript/data/placeName.txt', 'w')
        f.write(values[0])
        f.close()
        subprocess.run(["/opt/CongestionStatusGraspScript/run_calc_area.sh " + values[1] + " " + values[2]], shell=True)
    elif event == 'Start measurement':
        subprocess.run(["/opt/CongestionStatusGraspScript/regular_shooting_start.sh"], shell=True)
    elif event == 'End measurement':
        subprocess.run(["/opt/CongestionStatusGraspScript/regular_shooting_stop.sh"], shell=True)

window.close()
