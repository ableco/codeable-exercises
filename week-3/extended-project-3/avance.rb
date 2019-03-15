require "erb"

 team = [
  {
    name_id: "diegoc",
    name: "Diego Cuevas",
    answer1: " I'm immature.",
    answer2: "A person who talks as if they knew absolutely everything.",
    answer3: "They gotta be funny.",
    answer4: "People think that I'm careless, but l actually do care.",
    answer5: "Tell me it's good for me and there are no risks.",
    answer6:"Face-to-face. As straightforward as possible."
    
  },
  {  
    name_id: "angie",
    name: "Angie Gonzales",
    answer1: "I can spend too much time staring the moon",
    answer2: "News about sexual harassment towards children",
    answer3: "if they smile to me, are nice and honest",
    answer4: "I am flirty and it is not like that, I am just a kind and expressive person",
    answer5: "Showing me facts and making this information connect with me in an emotional way",
    answer6:"In private,and face-to-face."
  },
  { name_id: "marieth",
    name: "Marieth Perez",
    answer1: "I like sleeping, my family members say that I always sleep happy, smiling.",
    answer2: "I don't like heights, for example being on a very high bridge. I don't like that people don't stay true to their word.",
    answer3: "When people help poor children on the street.",
    answer4: "That I am bothered by something when in reality I am not",
    answer5: "When people tell me the exact purpose of what they want me to do",
    answer6: "I would like feedbacks to be in a constructive way." 
  },
  { name_id: "diegot",
    name: "Diego Torres",
    answer1: "a1",
    answer2: "a2",
    answer3: "a3",
    answer4: "a4",
    answer5: "a5"
  },
  {
    name_id: "valeria",
    name: "Valeria Vassallo",
    answer1: "I worry too much. I really pay attention to the details, so be careful!",
    answer2: "When people make some noises that bother me (e.g. screeching)",
    answer3: "Be honest. Be friendly. Don't be selfish nor arrogant.",
    answer4: "I swear I'm not mad at you! My personality and my face are just like that!",
    answer5: "Give me facts",
    answer6:"Definitely not face to face. I mean... I can deal with it, yes, but I still feel kind of uncomfortable. I'll get better at it, I promise!"
  }
]
template = "
<html>
  <body>
    <h1>List of team</h1>
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>What are some honest, unfiltered things about you?</th>
          <th>What drives you nuts?</th>
          <th>How can people earn an extra gold star with you?</th>
          <th>What are some things that people might misunderstand about you that you should clarify?</th>
          <th>What's the best way to convince you to do something?</th>
          <th>How do you like to get feedback?</th>
        </tr>
      </thead>
      <tbody>
      <%  a=team.select { |member| member[:name_id]== 'diegoc'} %>
        <h1>About <%= a[0][:name] %> :</h1>
       <tr>
         <th><%= a[0][:answer1] %></th>
         <th><%= a[0][:answer2] %></th>
         <th><%= a[0][:answer3] %></th>
         <th><%= a[0][:answer4] %></th>
         <th><%= a[0][:answer5] %></th>
        <th><%= a[0][:answer6] %></th>
        </tr>
      </tbody>
    </table>
  </body>
</html>
"

name_id_enviada='diegoc'

html = ERB.new(template).result(binding)

puts html




