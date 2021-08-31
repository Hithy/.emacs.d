(provide 'init-elfeed)

(require-package 'elfeed)

(global-set-key (kbd "C-x w") 'elfeed)

(setq elfeed-feeds
      '("https://manateelazycat.github.io/feed.xml"
        "http://www.gcores.com/rss"
        "http://www.yystv.cn/rss/feed"
        ))
