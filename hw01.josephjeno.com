server {
	listen 80;
	listen [::]:80;

        root /home/joe/hw01/josephjeno.com/;

	index index.html hw01.html;

	server_name hw01.josephjeno.com;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri /index.html =404;
	}
}
