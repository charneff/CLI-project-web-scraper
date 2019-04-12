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
        information_menu 
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
        puts "Please select an asana # for more information."
        puts "OR"
        puts "Type '*' for previous menu."
        puts "OR"
        puts "Type 'exit' to exit"
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
            if information.steps.start_with?("GO BACK")
                break
            elsif information.steps.start_with?(/[1..5]/)
                break
            elsif information.steps != nil
                if !information.steps.start_with?("See also") && !information.steps.start_with?("See More")
                    puts "#{information.steps}"
                end
            end
        end
    end


    def information_menu
        line_break
        puts "Type 'F' to return to list of focuses."
        puts "OR"
        puts "Type '*' to previous list of poses."
        puts "OR"
        puts "Type 'exit' to exit"
        input = gets.chomp
        line_break

        if input == "F"
            Pose.all.clear 
            display_focuses
            menu
            display_poses
            pose_menu
            display_information 
            information_menu
        elsif input == "P"
            Information.all.clear 
            display_poses
            pose_menu 
            display_information 
            information_menu
        elsif input == "exit"
            exit!
        end

    end
end 

 