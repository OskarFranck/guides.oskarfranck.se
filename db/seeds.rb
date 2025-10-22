# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The pre here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(name: 'oskar', email: 'oskar@mail.com', password: 'password')

Guide.create(
  creator: User.find_by(name: 'oskar'),
  title: "How to ssh with a jump / proxy host",
  description: "ssh, linux, proxy",
  created_at: Time.now,
  updated_at: Time.now,
  introduction: "Sometimes you need access to a host not on the same network as you. Luckily, ssh has a built-in jump/proxy option.",
  body: "In order to connect with a jump or a proxy you just have to provide the `-J` flag.
<pre class=\"has-background-code has-text-white\">
<code>ssh -J &lt;USER&gt;@&lt;PROXYHOST&gt; &lt;USER&gt;@&lt;TARGETHOST&gt;</code>
</pre>
This way ssh first connects to the proxy and then hops to the target host automatically.",
  is_draft: false
)

Guide.create(
  creator: User.find_by(name: 'oskar'),
  title: "How to check disk usage with du",
  description: "du, linux, disk usage",
  created_at: Time.now,
  updated_at: Time.now,
  introduction: "The `du` command helps you estimate and summarize the disk space used by files and directories.",
  body: "To view disk usage of a folder with human-readable sizes:
<pre class=\"has-background-code has-text-white\">
<code>du -cha &lt;DIRECTORY&gt;</code>
</pre>
The `-c` flag adds a total at the end, `-h` makes sizes human-readable, and `-a` shows all files, not just directories.
You can combine it with `sort -h` to see which files or directories consume the most space:
<pre class=\"has-background-code has-text-white\">
<code>du -cha &lt;DIRECTORY&gt; | sort -h</code>
</pre>",
  is_draft: false
)

Guide.create(
  creator: User.find_by(name: 'oskar'),
  title: "How to extract tar archives",
  description: "tar, linux, archives",
  created_at: Time.now,
  updated_at: Time.now,
  introduction: "The `tar` command is commonly used to compress or extract archive files.",
  body: "To extract a `.tar.gz` file:
<pre class=\"has-background-code has-text-white\">
<code>tar -xvzf &lt;ARCHIVE.tar.gz&gt;</code>
</pre>
To create one:
<pre class=\"has-background-code has-text-white\">
<code>tar -cvzf &lt;ARCHIVE.tar.gz&gt; &lt;DIRECTORY&gt;</code>
</pre>
Flags explained: `c` = create, `x` = extract, `v` = verbose, `z` = gzip compression, `f` = file name.",
  is_draft: false
)

Guide.create(
  creator: User.find_by(name: 'oskar'),
  title: "How to monitor logs in real-time with tail",
  description: "tail, linux, logs",
  created_at: Time.now,
  updated_at: Time.now,
  introduction: "The `tail` command prints the last lines of a file and can follow updates in real-time.",
  body: "To see the last 20 lines of a log:
<pre class=\"has-background-code has-text-white\">
<code>tail -n 20 /var/log/syslog</code>
</pre>
To follow as new lines are written:
<pre class=\"has-background-code has-text-white\">
<code>tail -f /var/log/syslog</code>
</pre>
You can combine with `grep` to filter:
<pre class=\"has-background-code has-text-white\">
<code>tail -f /var/log/syslog | grep error</code>
</pre>",
  is_draft: true
)

Guide.create(
  creator: User.find_by(name: 'oskar'),
  title: "How to count lines, words, and characters with wc",
  description: "wc, linux, text",
  created_at: Time.now,
  updated_at: Time.now,
  introduction: "The `wc` command (word count) reports line, word, and character counts in files.",
  body: "To count lines in a file:
<pre class=\"has-background-code has-text-white\">
<code>wc -l &lt;FILE&gt;</code>
</pre>
To count words:
<pre class=\"has-background-code has-text-white\">
<code>wc -w &lt;FILE&gt;</code>
</pre>
To count characters:
<pre class=\"has-background-code has-text-white\">
<code>wc -m &lt;FILE&gt;</code>
</pre>
Running without flags gives all three.",
  is_draft: false
)
