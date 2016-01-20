require 'yaml'

seeds = begin
  YAML.load(File.open("config/klasses.yml"))
rescue ArgumentError => e
  puts "Could not parse YAML: #{e.message}"
end

seeds['klasses'].each do |klass, klass_skills_categories|
  puts "Klass.where(title: '#{klass}').first_or_create"

  klass_skills_categories.each do |skills_category, skills|
    puts "SkillCategory.where(title: '#{skills_category}')"
    
    skills.each do |skill|
      puts "Skill.where(title: #{skill}, klass: #{klass}, skills_category: #{skills_category})" 
    end
  end
end
