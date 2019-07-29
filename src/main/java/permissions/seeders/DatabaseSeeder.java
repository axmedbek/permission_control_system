package permissions.seeders;

import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@Component
public class DatabaseSeeder {
    @EventListener(ApplicationReadyEvent.class)
    public void seed(){
        System.out.println("Seeder running....");
    }
}
