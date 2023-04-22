from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import pickle
import os
import time
import threading
import sys

# 设置Chrome浏览器选项
chrome_options = webdriver.ChromeOptions()
chrome_options.add_experimental_option('excludeSwitches', ['enable-logging'])
chrome_path = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
chrome_options.binary_location = chrome_path

# 检查是否存在cookie文件
if os.path.isfile("cookies.pkl"):
    # 如果文件存在，则加载cookie
    driver = webdriver.Chrome(options=chrome_options)
    driver.get("https://link.bilibili.com/#/my-room/start-live")

    # 加载cookie
    cookies = pickle.load(open("cookies.pkl", "rb"))
    for cookie in cookies:
        driver.add_cookie(cookie)

    # 打印当前页面 URL
    print("当前页面 URL：", driver.current_url)
else:
    # 如果文件不存在，则打开Chrome浏览器并手动登录
    driver = webdriver.Chrome(options=chrome_options)
    driver.get("https://link.bilibili.com/#/my-room/start-live")
        # 打印当前页面 URL
    print("当前页面 URL：", driver.current_url)

    input("请在浏览器中登录并按Enter键继续：")

    # 保存cookie以供下一次使用
    pickle.dump(driver.get_cookies(), open("cookies.pkl", "wb"))

    # 打印当前页面 URL
    print("当前页面 URL：", driver.current_url)

# 等待“选择分类”按钮出现并点击它
print("等待“选择分类”按钮并点击它...")
try:
    select_button = WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, "/html/body/div[1]/div/main/div/div[1]/div[2]/div/div[1]/section/div[1]/div[1]/div[1]/a")))
    select_button.click()
except:
    print("无法找到“选择分类”按钮")
    
# 检测重定向并重新加载页面
while "https://link.bilibili.com/#/my-room/start-live" not in driver.current_url:
    print("检测到页面重定向。")
    print("重新加载网页...")
    driver.get("https://link.bilibili.com/#/my-room/start-live")
    driver.refresh()
        # 打印当前页面 URL
    print("当前页面 URL：", driver.current_url)
    time.sleep(5)

# 等待弹窗加载完毕
time.sleep(2)


# 等待“选择分类”按钮出现并点击它
print("等待“选择分类”按钮并点击它...")
try:
    select_button = WebDriverWait(driver, 20).until(EC.element_to_be_clickable((By.XPATH, "/html/body/div[1]/div/main/div/div[1]/div[2]/div/div[1]/section/div[1]/div[1]/div[1]/a")))
    select_button.click()
except:
    print("无法找到“选择分类”按钮")


    # 等待弹窗加载完毕
time.sleep(2)


# 在弹出窗口中查找“单机游戏”类别并点击它
print("在弹出窗口中查找“单机游戏”类别并点击它...")
try:
    # 点击分类输入框
    game_input = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, "/html/body/div[1]/div/main/div/div[1]/div[2]/div/div[1]/section/div[1]/div[1]/div[2]/div[2]/div/input")))
    game_input.click()
    # 等待弹窗加载完毕
    time.sleep(2)
    # 输入“单机”
    game_input.send_keys("单机")
    # 等待弹窗加载完毕
    time.sleep(2)
    # 等待下拉列表出现并选择“单机游戏”分类
    game_category = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, "/html/body/div[1]/div/main/div/div[1]/div[2]/div/div[1]/section/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[1]/div/div/a")))
    game_category.click()
    # 等待弹窗加载完毕
    time.sleep(2)
    # 点击确定按钮
    confirm_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.XPATH, "/html/body/div[1]/div/main/div/div[1]/div[2]/div/div[1]/section/div[1]/div[1]/div[2]/div[2]/div/div[2]/div[3]/button[1]")))
    confirm_button.click()
    # 等待弹窗加载完毕
    time.sleep(2)
except:
    print("无法找到游戏分类或无法单击它")
    # 点击“开始直播”按钮
print("点击“开始直播”按钮...")
try:
    start_button = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CSS_SELECTOR, "button.btn.live-btn:not([disabled])")))
    start_button.click()
except:
    print("无法找到“开始直播”按钮")

def countdown():
    for i in range(15, 0, -1):
        print("倒计时：", i)
        time.sleep(1)
    # 数到1时退出脚本
    sys.exit()

# 创建并启动计时器线程
timer_thread = threading.Thread(target=countdown)
timer_thread.start()

# 等待倒计时结束
timer_thread.join()

# 关闭浏览器
driver.quit()
