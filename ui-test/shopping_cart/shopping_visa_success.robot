*** Settings ***
Library     SeleniumLibrary
Suite Teardown    Close All Browsers
*** Variables ***

*** Test Cases ***
ีuser ซื้อของเล่นให้ลูกสาว เลือกวิธีการจัดส่งเป็น kerry ชำระเงินด้วยบัตรเครดิตด้วย visa และชำระงเินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสินค้าที่ซื้อ
    นำสินค้าใส่ตะกร้า
    ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    ขอบคุณ
*** Keywords ***
แสดงสินค้า
    Open Browser    https://www.dminer.in.th/Product-list.html    chrome
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD

แสดงรายละเอียดสินค้า
    Click Button    id=viewMore-1
    Wait Until Element Is Enabled    id=productName
    Element Should Contain    id=productName    expected=43 Piece dinner Set
    Element Should Contain    id=productBrand    expected=CoolKidz
    Element Should Contain    id=productPrice    expected=12.95 USD

ระบุจำนวนสินค้าที่ซื้อ
    Input Text    id:productQuantity    1

นำสินค้าใส่ตะกร้า
    Click Button    id=addToCart

ยืนยันการสั่งซื้อและชำระเงินด้วยบัตรเครดิตวีซ่าคาร์ด
    Wait Until Page Contains    ยืนยันคำสั่งซื้อ
    Element Should Contain    id=totalProductPrice    expected=12.95 USD
    Element Should Contain    id=totalShippingCharge    expected=2.00 USD
    Element Should Contain    id=totalAmount    expected=14.95 USD
    Element Should Contain    id=productName-1    expected=43 Piece dinner Set
    Textfield Value Should Be    id=productQuantity-1    1
    Click Button    id=confirmPayment
    Wait Until Element Is Enabled    id=cardNumber
    Input Text    id:cardNumber    4719700591590995
    Input Text    id:expiredMonth    7
    Input Text    id:expiredYear    20
    Input Text    id:cvv    752
    Input Text    id:cardName    Karnwat Wongudon
    Click Button    id=Payment

ขอบคุณ
    Wait Until Element Is Enabled    id=title
    Element Should Contain    id=title    expected=ชำระเงินสำเร็จ
    Element Should Contain    id=notify    expected=วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900
    
    







    





