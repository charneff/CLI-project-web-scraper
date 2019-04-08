require 'open-uri'
require 'nokogiri'
require 'pry'

class Cli 

    def run 
        
        puts "Hi, friend!"
        puts "What brings you to your mat today?"
        line_break
        Scraper.scrape_yoga_journal
        display_focuses
        menu
        display_poses 
        pose_menu 
        display_information
    end

    def line_break 
        puts ""
        puts "---------------------------------------"
        puts ""
    end 

    def display_focuses
        puts "Focuses:"
        Focus.all.each.with_index(1) do |focus, i|
            puts "#{i}. #{focus.name}"
        end
    end

    def menu
        line_break
        puts "Please select a focus:"
        input = gets.chomp
        line_break
        
        focus = Focus.all[input.to_i - 1]
    
        if !focus 
            line_break
            puts "Invalid selection."
            puts "Try again, please!"
            menu
        elsif Pose.all == []
            Scraper.scrape_details(focus)
        end
    end

    def display_poses
        puts "Asanas/Poses to Practice:"
        Pose.all.each.with_index(1) do |pose, i|
            puts "#{i}. #{pose.name}"
        end
    end

    def pose_menu
        line_break
        puts "Please select an asana for more information."
        puts "OR"
        puts "Type '*' for previous menu."
        input = gets.chomp
        line_break
    
        pose = Pose.all[input.to_i - 1] 

        if !pose 
            puts "I didn't understand that."
            puts "Please select a pose."
            pose_menu

        elsif input == "*" 
            Pose.all.clear 
            display_focuses
            menu
            display_poses
            pose_menu

        elsif Information.all == []
            Scraper.scrape_specific_pose(pose)
        end
    end

    def display_information
        puts "About this Asana:"
        Information.all.each do |information|
            
            if information.a != nil
                puts "#{information.a}" if !information.a.start_with?("See also") 
            end

            if information.b != nil
                puts "#{information.b}" if !information.b.start_with?("See also")
            end

            if information.c != nil
                puts "#{information.c}" if !information.c.start_with?("See also")
            end

            if information.d != nil 
                puts "#{information.d}" if !information.d.start_with?("See also")
            end 

            if information.e != nil
                puts "#{information.e}" if !information.e.start_with?("See also")
            end

            if information.f != nil 
                puts "#{information.f}" if !information.f.start_with?("See also")
            end

            if information.g != nil
                puts "#{information.g}" if !information.g.start_with?("See also")
            end

            if information.h != nil
                puts "#{information.h}" if !information.h.start_with?("See also")
            end

            if information.i != nil
                puts "#{information.i}" if !information.i.start_with?("See also")
            end

            if information.j != nil
                puts "#{information.j}" if !information.j.start_with?("See also")
            end 
            
            if information.k != nil
                puts "#{information.k}" if !information.k.start_with?("See also")
            end

            if information.l != nil
                puts "#{information.l}" if !information.l.start_with?("See also")
            end 

            if information.m != nil
                puts "#{information.m}" if !information.m.start_with?("See also")
            end

            if information.n != nil
                puts "#{information.n}" if !information.n.start_with?("See also")
            end

            if information.o != nil
                puts "#{information.o}" if !information.o.start_with?("See also")
            end

            if information.q != nil
                puts "#{information.q}" if !information.q.start_with?("See also")
            end

            if information.r != nil
                puts "#{information.r}" if !information.r.start_with?("See also")
            end

            if information.s != nil
                puts "#{information.s}" if !information.s.start_with?("See also")
            end

            if information.t != nil 
                puts "#{information.t}" if !information.t.start_with?("See also") 
            end

            if information.u != nil
                puts "#{information.u}" if !information.u.start_with?("See also") 
            end

            if information.v != nil 
                puts "#{information.v}" if !information.v.start_with?("See also")
            end

            if information.w != nil 
                puts "#{information.w}" if !information.w.start_with?("See also") 
            end
            
            if information.x != nil
                puts "#{information.x}" if !information.x.start_with?("See also")
            end

            if information.y != nil
                puts "#{information.y}" if !information.y.start_with?("See also")
            end

            if information.z != nil
                puts "#{information.z}" if !information.z.start_with?("See also")
            end
        end
    end
end 