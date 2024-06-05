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

def register(name, email, phone, password, password_conf): 
    #menginput nama, email, phone, password, password confirmation
    column_name = driver.find_element(By.ID, "FirstName")
    column_email = driver.find_element(By.ID, "Email")
    column_phone = driver.find_element(By.ID, "Phone")
    column_password = driver.find_element(By.ID, "CreatePassword")
    column_passwordconf = driver.find_element(By.NAME, "customer[password_confirmation]")
    
    action.move_to_element(column_name).double_click().send_keys(name).move_to_element(column_email).double_click().send_keys(email).move_to_element(column_phone).double_click().send_keys(phone).move_to_element(column_password).double_click().send_keys(password).move_to_element(column_passwordconf).double_click().send_keys(password_conf).send_keys(Keys.ENTER).perform()

    try: #menutup elemen banner
        banner = driver.find_element(By.ID, "title-Close dialog 1")
        action.click(banner).perform()
        print("Closing Banner \n")
    except Exception as e:
        print(e, "Banner Not Found \n")


    try: #memastikan halaman yg dituju sudah benar (valid case)
        wait.until(EC.url_to_be("https://thermos.com/"))
        print("LOGIN SUCCESS \n")

    except: #(invalid case)
        print("LOGIN FAIL \n")



open_browser()
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("", "", "", "", "" )

register(" ", "amandaaq@gmail.com", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("Amandaaa", "", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("Amandaaa", "amandaaq@gmail.com", "", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "", "HAHAHAHA12341234" )
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "HAHAHAHA12341234", "" )

register("Amandaaa", "amandaaq", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("Amandaaa", "@gmail.com", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("Amandaaa", "amandaaq @gmail.com", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("Amandaaa", "amandaaq@gm##ail.com", "12345678910", "HAHAHAHA12341234", "HAHAHAHA12341234" )

register("Amandaaa", "amandaaq@gmail.com", "testphoneno", "HAHAHAHA12341234", "HAHAHAHA12341234" )
register("Amandaaa", "amandaaq@gmail.com", "1234#@!&910", "HAHAHAHA12341234", "HAHAHAHA12341234" )

register("Amandaaa", "amandaaq@gmail.com", "12345678910", "aman", "aman" )
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "Amandaa", "Amandaa" )
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "amanda12345", "amanda12345" )
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "amandaamelia", "amandaamelia" )
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "Amanda 12345", "Amanda 12345" )
register("Amandaaa", "amandaaq@gmail.com", "12345678910", "Amanda12345", "Amelia9876" )
