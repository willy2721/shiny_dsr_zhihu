# 經過 clean_text() 處理後的文本
output$text_pre_clean_text <- renderText({
  clean_text <- clean_text(input$text_pre_text)
  clean_text
})


# stop word word cloud
output$text_pre_all_stop_word_cloud <- renderPlot({
  # all_stop_word_df <- as.data.frame(matrix(all_stop_word[1:144], ncol = 12, nrow = 12))
  # colnames(all_stop_word_df) <- NULL
  # all_stop_word_df
  
  par(family=('Arial Unicode MS'))
  text_pre_all_stop_word_cloud <- wordcloud(words = all_stop_word_df$word, freq = all_stop_word_df$count, min.freq = 1,
            max.words=200, random.order=FALSE, rot.per=0.35, 
            colors=brewer.pal(8, "Dark2"))
  text_pre_all_stop_word_cloud
})


# stop word table
output$text_pre_all_stop_word_df <- renderTable({
    all_stop_word_df[1:10,]
})


# 經過 jieba 斷詞並濾掉 stop word 的文本
output$text_pre_filtered_text <- renderText({
  filtered_text <- filter_segment(seg_worker[clean_text(input$text_pre_text)], all_stop_word)
  filtered_text <- paste0(filtered_text, collapse = ' / ')
  filtered_text
})