# README

Private Events Project from the Odin Project:
https://www.theodinproject.com/lessons/ruby-on-rails-private-events

This project focused on associations between models:
<ul>
  <li>has_many</li>
  <li>has_many :through
  <li>belongs_to</li>
</ul>

How they connect to each other
<ul>
  <li>source</li>
  <li>class_name</li>
  <li>foreign_key</li>
</ul>

And how to use them for better-querying
    @user.attending_events.future_events
    @events.not_private.future_events
