# README

El proyecto es un ejemplo de aplicación web construida con Ruby on Rails 5.1.7
antes de trabajar `bundle install`
                  `rails db:migrate`
Tarea:
Un mensaje tiene los paréntesis balanceados cuando cumple una de las siguientes reglas:
1. Es un mensaje vacío
2. Contiene sólo una o más repeticiones de las letras "a" a la "z", espacio " ", o dos puntos ":"
3. Comienza por un paréntesis de apertura "(", seguido de un mensaje con paréntesis balanceados, seguido de un paréntesis de cierre ")"
4. Es un mensaje con paréntesis balanceados seguido de otro mensaje con paréntesis balanceados
5. Es un emoticón feliz ":)" o uno triste ":("

Crea un programa que identifique *si existe al menos una forma* de interpretar la entrada como un mensaje de paréntesis balanceados. La entrada es un string y la salida debe ser "balanceado" o "desbalanceado"