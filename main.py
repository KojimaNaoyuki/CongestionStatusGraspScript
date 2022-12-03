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
    [sg.Text('混雑状況共有システム', font=('Arial', 30))],
]
col2 = [
    [sg.Text('計測地点名', font=('Arial', 16)), sg.InputText(font=('Arial', 20), size=(10, 2)), sg.Text('天井までの距離', font=('Arial', 16)), sg.InputText(font=('Arial', 20), size=(10, 2))]
]
col3 = [
    [sg.Button('計測地点登録', font=('Arial', 20), size=(100, 2))],
]
col4 = [
    [sg.Button('計測開始', font=('Arial', 20), size=(100, 2))],
]
col5 = [
    [sg.Button('混雑状況閲覧', font=('Arial', 20), size=(100, 2))]
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
window = sg.Window('混雑状況共有システム', layout, resizable=True, size=(window_size[0], window_size[1]))

# イベントループ
while True:
    event, values = window.read()
    if event == sg.WIN_CLOSED:
        break
    elif event == '計測地点登録':
        subprocess.run(["/opt/CongestionStatusGraspScript/run_calc_area.sh " + values[1]], shell=True)
    elif event == '計測開始':
        subprocess.run(["/opt/CongestionStatusGraspScript/regular_shooting_start.sh"], shell=True)
    elif event == '混雑状況閲覧':
        webbrowser.open("https://www.google.com", new=2, autoraise=True)

window.close()
