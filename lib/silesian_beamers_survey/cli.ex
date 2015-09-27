defmodule SilesianBeamersSurvey.CLI do
  def main(_args) do
    IO.puts "Hello World!"
    send_email("BODY")

    IO.gets ">"
  end

  def send_email(body) do
    :gen_smtp_client.send(
      { "silesian.beamers.survey@gmail.com",
        ["silesian-beamers@white-rook.pl"],
        "Subject: Survey!\r\nFrom: Participant \r\nTo: Silesian BEAMers \r\n\r\n" <> body},
      [ {:relay, "smtp.gmail.com"},
        {:username, "silesian.beamers.survey@gmail.com"},
        {:tls, :never},
        {:auth, :always},
        {:ssl, :true},
        {:port, 465},
        {:password, System.get_env("GMAIL_PASSWORD")}
      ])
  end
end
