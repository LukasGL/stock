cd "C:\xampp\mysql\bin" 
mysqldump -u root stock > "C:\Users\lukas\Documents\SQLbackup\stockdb_%date:~-4,4%%date:~-10,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.sql"