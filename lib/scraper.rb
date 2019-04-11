class Scraper 
    YOGA_JOURNAL = "https://www.yogajournal.com"
    
    def self.scrape_yoga_journal

        html = open(YOGA_JOURNAL + "/poses/yoga-by-benefit")
        doc = Nokogiri::HTML(html)
        doc.css(".l-grid--item").each do |reason|
            focus = reason.css(".m-card--content").text
            if focus.to_s.start_with?("Yoga for")
                name = focus.to_s.delete_prefix("Yoga for ").strip 
                url = reason.css(".m-card--content a").attr("href").value
                focus = Focus.new(name, url)
                focus.save
            end
        end    
    end

    def self.scrape_details(new_focus)
    
        html = open(YOGA_JOURNAL + new_focus.url)
        doc = Nokogiri::HTML(html)
                 
        doc.css(".m-card-group--content.l-grid.lm-grid--density-standard.lm-grid--standard-cards .l-grid--item").each do |pose|
            
            if pose.css(".m-card--content a").attr("href") != nil 
                pose_name = pose.css(".m-card--content h2").text
                url = pose.css(".m-card--content a").attr("href").value 
                posture = Pose.new(pose_name, url)
                posture.save
            end
        end   
    end

    def self.scrape_specific_pose(posture)
    
        html = open(YOGA_JOURNAL + posture.url)
        doc = Nokogiri::HTML(html)
        instructions = []
        
        doc.css(".l-grid--content-body .m-detail--body").each do |strings|                 
            i = 0 
            while i <= 25 
                if strings.css("p")[i] != nil
                    steps = strings.css("p")[i].text
                    instructions << {:steps => steps}
                end
            i += 1
            end         
        end
        Information.create_from_collection(instructions) 
    end 
end