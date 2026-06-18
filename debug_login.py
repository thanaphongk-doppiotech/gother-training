from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver = webdriver.Chrome()
driver.maximize_window()

# Try different gother login URLs
login_urls = [
    'https://www.gother.com/th-th/login',
    'https://www.gother.com/login',
    'https://www.gother.com/th-th/auth/login',
    'https://www.gother.com/auth/login',
    'https://www.gother.com/th-th/account/login',
]

for url in login_urls:
    try:
        driver.get(url)
        time.sleep(3)
        print(f'URL: {url}')
        print(f'Title: {driver.title}')
        print(f'Current URL: {driver.current_url}')
        
        # Check for inputs
        inputs = driver.find_elements(By.XPATH, '//input[not(@type="hidden")]')
        print(f'  Inputs found: {len(inputs)}')
        for inp in inputs[:5]:
            print(f'    type={inp.get_attribute("type")}, placeholder={inp.get_attribute("placeholder")}')
        
        # Check for auth elements
        auth = driver.find_elements(By.XPATH, '//*[contains(text(), "เข้าสู่ระบบ") or contains(text(), "เข้าสู่ระบบ/สมัครสมาชิก")]')
        print(f'  Auth elements: {len(auth)}')
        
    except Exception as e:
        print(f'Error with {url}: {e}')
    print('---')

driver.quit()
