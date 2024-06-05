import os
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver import ActionChains
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import NoAlertPresentException
import time

def open_browser(): #membuka website
    print("Opening Website ... \n")
    global action,driver,wait
    os.environ['PATH'] += r"C:\Program Files (x86)\chromedriver.exe"

    options = webdriver.ChromeOptions()
    options.add_experimental_option("detach", True)
    driver = webdriver.Chrome(options=options)
    action = ActionChains(driver)
    wait = WebDriverWait(driver,10)

    driver.get("https://thermos.com/account/register")
    driver.maximize_window()
    print("Successfully opened the website \n")

def login(name, email, phone, password, password_conf): 
    #menginput username, password, dan pin
    column_name = driver.find_element(By.ID, "FirstName")
    column_email = driver.find_element(By.ID, "Email")
    column_phone = driver.find_element(By.ID, "Phone")
    column_password = driver.find_element(By.ID, "CreatePassword")
    column_passwordconf = driver.find_element(By.NAME, "customer[password_confirmation]")
    
    action.move_to_element(column_name).click().send_keys(name).move_to_element(column_email).click().send_keys(email).move_to_element(column_phone).click().send_keys(phone).move_to_element(column_password).click().send_keys(password).move_to_element(column_passwordconf).click().send_keys(password_conf).send_keys(Keys.ENTER).perform()
    
    try: #memastikan halaman yg dituju sudah benar
        wait.until(EC.url_to_be("https://thermos.com/"))
        print("LOGIN SUCCESS \n")
 
    except:
        print("LOGIN FAIL \n")

login("Amandaaa", "amandaa@gmail.com", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )