                                                            ###Send R output to telegram


     ###Steps:

# 1. Install Telegram
# 2. Search for BotFather in the search box
# 3. Open BotFather and click on START
# 4. Type /newbot and press enter
# 5. Choose a unique name for the bot. Type it and enter
# 6. Choose a unique username for the bot. It must end with bot. Type it and enter
# 7. Search for the username in the search box that you just created
# 8. Click on start and type some message
# 9. Go to https://api.telegram.org/bot<token>/getUpdates
# 10. Find the chat id from the message description.

#If you want to send to multiple contacts, ask your friends to install telegram and do the above process from 1-8. 
#Get chatid and tokenid of telegram bot from all your contacts to whom you have to send message.

     ###Code starts

#Load libraries
library(telegram)    
library(taskscheduleR)  #to schedule R script

#dummy output
value<-2000

#Function to send to telegram
send_message <- function(text, chat_id, bot_token){
  require(telegram)
  bot <- TGBot$new(token = bot_token)
  bot$sendMessage(text = text, chat_id = chat_id)
}

#Replace value,chat_id,bot_token with the values. Use chat_id without quotes and token inside the quotes.
#syntax: send_message(value,chat_id,bot_token)

#To send to one contact, use:
send_message(value,619896829,"1016013901:AAHBx6i-KoQ93jFQtqtEFwMbz0jCEXSS8Ts") 

#To send to multiple contacts, use loop and in below vectors chatid and tokenid, add chatid and token of your friends telegram bot like below:
#(Below I have used dummy chatid and tokenid)

chatid<-c("619896829","619896409")
tokenid<-c("1016013901:AAHBx6i-KoQ93jFQtqtEFwMbz0jCEXSS8Ts","1016013902:AAHBx7i-KoQ93jFQtqtEFwMbz0jCEXSS8Ts")

for (i in 1:length(chatid)){
  send_message(value,as.numeric(chatid[i]),tokenid[i])
}

    ###Schedule the script

#locate the file 
myscript <- "C:/Users/Public/Documents/send_routput_to_telegram.R"

#schedule this script to run daily at 21:00
taskscheduler_create(taskname = "sendoutputdaily", rscript = myscript, 
                     schedule = "DAILY", starttime = "21:00", startdate = format(Sys.Date(), "%d/%m/%Y"))


### Note: You can either schedule this script through code as done above or select Addins from toolbar and then select
### 'Schedule R Scripts on Windows', choose file and schedule daily/weekly/monthly at specified time.




