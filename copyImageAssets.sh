FILE="$HOME/hoodsguru.pem"

if [ -e $FILE ]
then
	printf "Hoods Guru private key found\n"
else
	printf "hoodsguru.pem private key missing...\nMake sure hoodsguru.pem is in your HOME directory"
	exit 3
fi

printf "Enter type of image (mood, submood, event, business):\n"
read STORE_DIR

case $STORE_DIR in
	mood | moods ) STORE_DIR="/home/ubuntu/api/hoodsguru/assets/mood" ;;
	submood | submoods ) STORE_DIR="/home/ubuntu/api/hoodsguru/assets/submood" ;;
	event | events ) STORE_DIR="/home/ubuntu/api/hoodsguru/assets/event" ;;
	business ) STORE_DIR="/home/ubuntu/api/hoodsguru/assets/business" ;;
esac

for i; do
	scp -i "$FILE" $i ubuntu@ec2-52-34-233-122.us-west-2.compute.amazonaws.com:$STORE_DIR
done
