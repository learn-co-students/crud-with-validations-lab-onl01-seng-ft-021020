

  <div class="field<%= ' field_with_errors' if @song.errors[:title].any? %>">
    <%= label_tag "title", "Title" %>
    <%= text_field_tag "name", @song.name %>
  </div>
 
  <div class="field<%= ' field_with_errors' if @song.errors[:released].any? %>">
    <%= label_tag "released", "released" %>
    <%= text_field_tag "released", @song.released %>
  </div>

  <div class="field<%= ' field_with_errors' if @song.errors[:release_year].any? %>">
  <%= label_tag "release_year", "release year" %>
  <%= text_field_tag "release_year", @song.release_year %>
</div>

  <div class="field<%= ' field_with_errors' if @song.errors[:artist_name].any? %>">
  <%= label_tag "artist_name", "release year" %>
  <%= text_field_tag "artist_name", @song.artist_name %>
</div>