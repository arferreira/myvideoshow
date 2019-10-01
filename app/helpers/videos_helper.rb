module VideosHelper

    def view_number(video)
        "#{video.count_viewed}/#{video.count}"
    end

    def statuses_map
        Video.statuses.keys.to_a
    end
    
end
