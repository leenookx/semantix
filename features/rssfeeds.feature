Feature: rss_feeds
  In order to keep up with the news
  Users should be able to
  Specify and manage RSS feeds

    Scenario: Add feed
      Given that the user wants to add a feed
      When the user enters the feed details
      Then the system should save them

