require 'json'
# Iterate through data and:
## Return the ~ title ~ of the most likes v. dislikes
## Average % of likes vs. dislikes for 12 videos
## Total number of views
## ~ Bonus ~ the average time interval between videos

file        = File.read('zoella_videos.json')
videos_hash = JSON.parse(file)
p videos_hash


# Done:
# Read the JSON file, store data
