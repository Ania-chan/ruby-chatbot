require 'socket'

server = 'orwell.freenode.net'
port   = 6667
socket = TCPSocket.open(server, port)

nickname = 'SkillcrushBotOMG'
channel = '#BananaStand123'

socket.puts "NICK #{nickname}"
socket.puts "USER #{nickname} O * #{nickname}"
socket.puts "JOIN #{channel}"

socket.puts "PRIVMSG #{channel} :I am so happy to be here!"



while message = socket.gets do
    puts message

    if message.match('^PING :')
        server = message.split(':').last
        puts "PONG #{server}"
        socket.puts "PONG #{server}"
    elsif message.match("How are you?")
        puts "PRIVMSG #{channel} :I'm great, thanks!"
        socket.puts "PRIVMSG #{channel} :I'm great, thanks!"
    elsif message.match("#{nickname} I want to be your BFF!")
        bffName = message.split('!').first.slice(1..-1)
        puts "PRIVMSG #{channel} :Great! I'll need to remeber your name than :)"
        socket.puts "PRIVMSG #{channel} :Great! I'll need to remeber your name than :)"
        File.write('filename.txt', "#{bffName}")
    elsif message.match("Who is your BFF?")
        friendName = File.read("filename.txt")
        socket.puts "PRIVMSG #{channel} :#{friendName}"
    elsif message.match("BFFBot I feel down, inspire me!")
        puts "It is during our darkest moments that we must focus to see the light. - Aristotle"
        socket.puts "PRIVMSG #{channel} :It is during our darkest moments that we must focus to see the light. - Aristotle"
    end
end