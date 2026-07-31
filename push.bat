@echo off
echo ==============================================
echo Git一键提交推送脚本
echo ==============================================
set "defaultMsg=更新文件"
set "commit_msg="
set /p commit_msg=请输入提交备注(直接回车使用默认【%defaultMsg%】):
if not defined commit_msg set commit_msg=%defaultMsg%

echo [1/3] git add .
git add .

echo [2/3] git commit -m "%commit_msg%"
git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo 未检测到文件改动，停止推送
    pause
    exit
)

echo [3/3] git push
git push

echo.
echo 执行完成！
pause