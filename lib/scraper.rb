class Scraper 
    YOGA_JOURNAL = "https://www.yogajournal.com/poses/yoga-by-benefit"
    
    def self.scrape_yoga_journal

        html = open(YOGA_JOURNAL)
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
        
        doc.css(".l-grid--content-body .m-detail--body").each do |strings|
         
            if strings.css("p")[0] != nil
                a = strings.css("p")[0].text
            end

            if strings.css("p")[1] != nil
                b = strings.css("p")[1].text
            end

            if strings.css("p")[2] != nil
                c = strings.css("p")[2].text
            end
            
            if strings.css("p")[3] != nil 
                d = strings.css("p")[3].text 
            end

            if strings.css("p")[4] != nil
                e = strings.css("p")[4].text 
            end

            if strings.css("p")[5] != nil 
                f = strings.css("p")[5].text 
            end

            if strings.css("p")[6] != nil
                g = strings.css("p")[6].text 
            end

            if strings.css("p")[7] != nil
                h = strings.css("p")[7].text 
            end

            if  strings.css("p")[8] != nil
                i = strings.css("p")[8].text
            end

            if strings.css("p")[9] != nil
                j = strings.css("p")[9].text
            end

            if strings.css("p")[10] != nil
                k = strings.css("p")[10].text
            end

            if strings.css("p")[11] != nil
                l = strings.css("p")[11].text 
            end

            if strings.css("p")[12] != nil
                m = strings.css("p")[12].text
            end

            if strings.css("p")[13] != nil
                n = strings.css("p")[13].text
            end

            if strings.css("p")[14] != nil
                o = strings.css("p")[14].text 
            end

            if strings.css("p")[15] != nil
                q = strings.css("p")[15].text 
            end

            if strings.css("p")[16] != nil
                r = strings.css("p")[16].text 
            end

            if  strings.css("p")[17] != nil
                s = strings.css("p")[17].text 
            end

            if strings.css("p")[18] != nil
                t = strings.css("p")[18].text 
            end

            if strings.css("p")[19] != nil 
                u = strings.css("p")[19].text
            end 

            if strings.css("p")[20] != nil
                v = strings.css("p")[20].text 
            end

            if strings.css("p")[21] != nil
                w = strings.css("p")[21].text
            end

            if strings.css("p")[22] != nil
                x = strings.css("p")[22].text
            end

            if strings.css("p")[23] != nil
                y = strings.css("p")[23].text
            end

            if strings.css("p")[24] != nil
                z = strings.css("p")[24].text 
            end

                                
            
            directions = Information.new(a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,q,r,s,t,u,v,w,y,z) 
            directions.save
            
        end
    
                       
    end 

    #when displaying steps, should ask user if they would like to return to the pose menu or focus menu

end