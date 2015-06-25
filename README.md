# WWW Final Project 2015

<div>Topic : Book Ordering System</div>
<div>Developer : 401410020 李盈 401410069 傅皓群</div>
<div>Technique and Plugin : Ruby on Rails、sematic UI、fullPage</div>

## 發想
為了讓小型訂書活動可以有一個資訊集中的管理平台，讓負責訂書的人或是要訂書的人可以更便利得參與此活動。

## 功能
### 註冊
1. 進到登入頁面後，點擊 REGISTER
2. 填寫資料後，即可註冊成功 (可檢驗：帳號重複，一點點的電子郵件和手機格式檢查)

### 主頁面 (登入後)
#### 瀏覽公告
● 可透過兩旁的左、右箭頭切換上、下則公告
● 也可透過左邊的公告導覽選擇有興趣的標則，可自動切到對應公告

#### 訂書
1. 瀏覽目前可訂的書目、資訊
2. 點擊 order 按鈕即可下訂單，若要取消，則點擊 unorder 按鈕
3. 若訂單完成 (ex: 繳清書錢)，會顯示 Order Complete

### 修改個人資料
1. 點擊 Profile 按鈕
2. 分別可修改基本資料和密碼

### 管理介面
#### 使用者
1. 點擊 User 按鈕
2. 可點擊 edit 按鈕做密碼和權限的修改
3. 也可點擊 delete 按鈕做刪除

#### 書
1. 點擊 Book 按鈕
2. 可點擊 Create book 按鈕做新增 (書目、圖片、價錢、...等)
3. 可點擊 edit 按鈕做修改 (注意：圖片若此次沒有要修改，則不用再重新上傳一次；若要修改，則直接選擇新圖)
   open 選項 : open => 開放訂購 (主頁面才看得到)   close => 不開放訂購 (主頁面看不到)
4. 可點擊 delete 按鈕做刪除

#### 公告
1. 點擊 News 按鈕 
2. 可點擊 Create announcement 按鈕做新增
3. 可點擊 edit 按鈕做修改
4. 可點擊 delete 按鈕做刪除
5. 可點擊 email 按鈕把此公告發給所有接受 email 通知的使用者 (依據 email notify 是否是 yes) (服務請 Gmail 幫忙)

#### 訂單
1. 點擊 Order 按鈕
2. 未完成或取消的訂單，可更新已繳費用：輸入在 update pay-amount 上的輸入欄，再按 udpate pay-amount 按鈕
3. 可點擊 delete 按鈕刪除訂單
4. 可點擊 complete 按鈕，確認訂單完成

# memo
助教可透過帳號 TAviewer (密碼相同) 到開發的 workspace (https://ide.c9.io/fwpp/www-project-dev) 觀看